# Automics II API

Automics II is a [Horizon Digital Economy Research](http://www.horizon.ac.uk) project to explore the group creation of micro comics that can be created and shared during a day out - to a theme park for example.  You can read more about the project on the [Automics website](http://automicsii.wp.horizon.ac.uk/).

The Automics II API provides the interface between the mobile applications that create and view comics and the database and web back end.

## API Overview
 
The Automics II server implements a REST API over the following objects of interest...

Object	Description	Example	Index
Group	The group within which the comic is shared.	Steve’s trip to Alton Towers 	Group Name
User	A user of the service.	Steve	User Name  
Organisation	An event organisation.	Alton Towers, Nottingham Forest	Organisation Name
Theme	A comic styling.	Nottingham Forrest Red	Id
Resource	An themed image or Text.	Logo, Frame, Page, CSS, professional photographs	Id
Event	An organisation specific group.	FA Cup, New Years Eve	Id
Photo	A photograph or other image		Id
Annotation	A caption to be placed on an image.	“Come on you Reds!”	Id
Panel	A styled editable image with annotations	Steve cheering with annotations and red border.	Id
Comic	A comic strip.	Steve Cheers a Goal!	Id

## Access and Security
The API uses a session token submitted in the header of each REST request to authenticate the User in the request .  This authentication then permits manipulation of the data according to the following hierarchy:
*	Group iff User is a member of the group.
*	Comic iff User is a member of the Comic’s group.
*	Image iff User is a member of the PhotoImage’s group. 
*	Annotation iff User is a member or the Annotation’s group.
*	Theme if User’s (current) group is a member of the theme. 
*	Theme always
*	Event restricted (no resources) unless User’s current group is a member of the event’s Theme.
*	Resource (???)
*	Organisation always.

## HTTP
The API sets out to correctly use HTTP response codes for HTTP API request status.  API clients should handle any valid HTTP response code including redirect.  Possible response codes include: 

Code	Meaning	Description

<table>
<tr>| 200 	| OK             	         | Request successful - response contains valid data </tr>
<tr>| 400 	| Bad Request    	         | The request was not well formed or required parameters were missing </tr>
<tr>| 403 	| Not Authorized 	         | Authentication failed.  API key may be unrecognised or not authorised for to access the data at the given URL </tr>
<tr>| 404 	| Not Found      	         | The API element was not found </tr>
<tr>| 500 	| Internal Server Error 	  | Problem with the service. </tr>
</table>

## Format
In general API requests follow the REST CRUD (Create, Retrieve, Update, Delete) model using HTTP PUT, POST, GET, and DELETE verbs.
All requests are built from URLs which follow the format:
http://<hostname>/<api-major-version>/<object>[/<qualifiers>]
Concretely all request URL’s begin with the sequence:
http://automics.data.horizon.ac.uk/v1/
All retrieved data and POST data is in JSON format.  
API Reference

Each object below is described initially with a concise notation where square brackets [] denote a list and name:type denotes the name and data type.  As this is an API document this section describes the interface, not the structure of the supporting database.

TODO- 
Current Group 
Authentication
Group Join/Leave
Group Invite
Explicit get/set data

### Group
[name: String, id: Integer, organisation:  Integer, event: Integer, <...etc..>]
Index
GET  http://automics.data.horizon.ac.uk/v1/group
List all groups (for which the user is a member).  Note that user is derived from the authentication token.
Get
GET  http://automics.data.horizon.ac.uk/v1/usergroup/<name>
{<data>}
Set
PUT  http://automics.data.horizon.ac.uk/v1/group/<name>
{<data>}
Delete
DELETE  http://automics.data.horizon.ac.uk/v1/group/<name>
Deletes the group.  Delete is only activated when two or more members have requested the deletion.   Deleting the group removes all panels and comics belonging to the group. 

### User
[name: String, given_name: String, family_name: String , email_address: String, password_crypt: String, [group: String], <...etc..>]
Index
GET  http://automics.data.horizon.ac.uk/v1/user
List all users of the groups for which the user is a member.  
Get
GET  http://automics.data.horizon.ac.uk/v1/user/<name>
{<data>}
Set
PUT  http://automics.data.horizon.ac.uk/v1/user/<name>
{<data>}
Only valid when user is the authenticated user.
Delete
DELETE  http://automics.data.horizon.ac.uk/v1/user/<name>
Only valid when user is the authenticated user.  Deleting the user does not delete other objects unless the user is the last user in a group, in which case the group and all associated objects are deleted.

### Organisation
[name: String, id: Integer,[event: Integer], [theme: Integer], <...etc..>]
Index
GET  http://automics.data.horizon.ac.uk/v1/organisation
List all organisations.
Get
GET  http://automics.data.horizon.ac.uk/v1/ organisation /<name>
{<data>}
###  Event
[name: String, id: Integer, [resource: Integer],  [theme: Integer], <...etc..>]
Index
GET http://automics.data.horizon.ac.uk/v1/organisation/<org_id>/event
List all events belonging to an organisation.
Get
GET  http://automics.data.horizon.ac.uk/v1/event /<id>
{<data>}

### Theme
[name: String, id: Integer, [resource:  Integer], <...etc..>]
Index
GET http://automics.data.horizon.ac.uk/v1/event/<event_id>/theme
List all themes of an event.
Get
GET  http://automics.data.horizon.ac.uk/v1/ theme /<id>
{<data>}
### Resource
[name: String, type: String, image: Blob, text: String, <...etc..>]
Get
GET  http://automics.data.horizon.ac.uk/v1/ resource /<id>
{<data>}

### Photo
[description: String, id: Integer, group: String, data: Blob, width: Integer, height: integer , format: String ]
Index
GET http://automics.data.horizon.ac.uk/v1/photo
List all photos for the current group.  
Get
GET  http://automics.data.horizon.ac.uk/v1/photo/<id>
{<data>}
Set
PUT  http://automics.data.horizon.ac.uk/v1/photo/<id>
{<data>}
Delete
DELETE  http://automics.data.horizon.ac.uk/v1/photo/<id>
Delete accepted for any photo in the current group. 

### Annotation
[text: String, id: Integer, group: Integer,  photo: Integer, bubble_style: String, formatting_options: String, xpos_percent: Float, ypos_percent: Float, <...etc..> ]
Index
GET http://automics.data.horizon.ac.uk/v1/photo/<id>/annotation
List all annotations for photo – if photo is not a member of the current group error 400 is returned.   
Get
GET  http://automics.data.horizon.ac.uk/v1/annotation/<id>
{<data>}
Set
PUT  http://automics.data.horizon.ac.uk/v1/annotation/<id>
{<data>}
Delete
DELETE  http://automics.data.horizon.ac.uk/v1/annotation/<id>
Delete accepted for any annotation in the current group. 

### Panel
[id: Integer, group: Integer, [resource: integer, z-order: Integer], [photo: Integer, z-order: Integer, position: String, scale: Float], [annotation: id]]
Index
GET http://automics.data.horizon.ac.uk/v1/comic/<comic_id>/panel
List all panels for the specified comic.  Return error 400 is comic does not belong to the current group.  
Get
GET  http://automics.data.horizon.ac.uk/v1/panel/<id>
{<data>}
Set
PUT  http://automics.data.horizon.ac.uk/v1/panel/<id>
{<data>}
Delete
DELETE  http://automics.data.horizon.ac.uk/v1/ panel/<id>
Delete accepted for any panel in the current group. 

### Comic
[name: String, description: String, id: Integer, group: Integer, event: Integer, [panel: Integer] , comic_image: Integer, <...etc..> ]
Index
GET http://automics.data.horizon.ac.uk/v1/comic
List all comics for the current group.
Get
GET  http://automics.data.horizon.ac.uk/v1/comic/<id>
{<data>}
Set
PUT  http://automics.data.horizon.ac.uk/v1/comic/<id>
{<data>}
Delete
DELETE  http://automics.data.horizon.ac.uk/v1/ comic/<id>
Delete accepted for any comic in the current group.  Deleting a comic deletes all panels in the comic.



