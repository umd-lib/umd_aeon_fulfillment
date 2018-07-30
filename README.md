# UMD ArchivesSpace Request Fulfillment via Aeon

## Overview

The [Aeon Fulfillment](https://github.com/AtlasSystems/ArchivesSpace-Aeon-Fulfillment-Plugin)
plugin adds a new request button to archival objects that allows researchers to
place Aeon requests for archival objects discovered via the ArchivesSpace Public User Interface.

This plugin extends and undoes some of the Aeon plugin. Essentially it removes
the ability to request a top_container from an archival object, but instead
directs users to the top_container's record page, where they can then submit
the request. This includes some additional instructions for requests.

To install this plugin, simply download the code into the plugin directory, add: 

```ruby
AppConfig[:plugins] << "aeon_fulfillment"
AppConfig[:plugins] << "umd_aeon_fulfillment"
```

to you config.rb file, and restart application.


