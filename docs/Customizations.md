# Customizations

## Introduction

This document describes the UMD customizations made to the
[ArchivesSpace-Aeon-Fulfillment-Plugin][aeon_fulfillment] plugin.

## UMD Customizations

The "umd_aeon_fulfillment" plugin customizes the
"ArchivesSpace-Aeon-Fulfillment-Plugin" plugin so that:

* Only "top containers" can be requested

* The following instructions are shown in a blue box underneath the navigation
  bar on "collection" and "series" pages (which cannot be requested), instead of
  a disabled "request" button:

  > Use the right side menu to identify relevant boxes and place requests.

* On an individual "file" page (which can be requested):

  * The following instructions are shown in a blue box underneath the navigation
    bar:

    > Use the right side menu to identify relevant boxes and place requests.

  * A "Request Box {N}" button is displayed next to the "Citation" button,
    where {N} is the box number containing the file.

* When the "Request Box {N}" button on the "file" page is clicked, the page for
  the box (i.e., the "top container") is displayed, with a sidebar containing
  the following:

  * A blue box with the instructions:

    > Click button below to request this box. You will be asked to register/sign
    > in to your Special Collections Research Account to complete your request.

  * A "Request Box {N}" button

* When the "Request Box {N}" button on the "box" page is clicked, the user is
  redirected to Aeon, along with the following information related to the
  box:

  * Title - consisting of {Collection Name} {Series Name}
  * Series - consisting of {Series Name}
  * Library - The library associated with the collection
  * Volume/Box - The {Box} {Box Series} and {Barcode}
  * Restrictions - whether or not the item is restricted

## Verification Steps

The following steps are intended to verify that the umd_aeon_fulfillment_plugin
is working properly.

The steps are assume that the "William L. Amoss papers" collection is available,
either by running the steps against either an actual server, or in a local
development environment set up with sample data according to the instructions
in the "[docs/DevelopmentSetup.md][dev_setup]" document in the
"[umd-lib/aspace-custom][aspace-custom]" GitHub repository.

1) In a web browser, go to the ArchivesSpace public interface home page.

2) On the public interface home page, enter `William L. Amoss papers` into the
   "Enter your search terms" textbox, and left-click the "Search" button. A
   search results page will be displayed.

3) On the search results page, left-click the "William L. Amoss papers"
   collection result. The "William L. Amoss papers" page will be displayed.

4) On the "William L. Amoss papers" page, verify that a blue box is displayed
   just below the navigation bar, with the text:

   > Use the right side menu to identify relevant boxes and place requests.

   In the right sidebar, left-click the "Subject Files, 1895-1927" entry. The
   "Subject Files, 1895-1927" page will be displayed.

5) On the "Subject Files, 1895-1927" page, verify that:

   * a blue box is displayed just below the navigation bar, with the text:

     > Use the right side menu to identify relevant boxes and place requests.

   * a "Request" button is *not* shown next to the "Download PDF" button

   In the right sidebar, left-click the "Alabama, 1916" entry. The
   "Alabama, 1916" page will be displayed.

6) On the "Alabama, 1916" page, verify that:

    * a blue box is displayed just below the navigation bar, with the text:

      > Use the right side menu to identify relevant boxes and place requests.

    * A "Request Box 1" button is displayed to the right of the "Download PDF"
      button.

   Left-click the "Request Box 1" button. The "Box 1" page will be displayed.

7) On the "Box 1" page, verify that in the right sidebar is a blue box with the
  text:

    > Click button below to request this box. You will be asked to
    > register/sign in to your Special Collections Research Account to complete
    > your request.

   and below the text is a "Request Box 1" button.

   Left-click the "Request Box 1" button. A separate browser tab will open with
   the Aeon login page.

8) Log in to Aeon. After logging in, the "Special Collections Account" page will
   be displayed with a "Saved Request" of
   "William L. Amoss papers Subject Files, 1895-1927".

   Left-click the "Edit" button in the "Saved Request". The "Edit Request" page
   will be displayed.

9) On the "Edit Request" page, verify the contents of the following fields:

    | Field        | Value |
    | ------------ | ----- |
    | Title        | William L. Amoss papers Subject Files, 1895-1927 |
    | Series       | Subject Files, 1895-1927|
    | Library      | Maryland Room (on production server), \<blank> (in local dev environment) |
    | Volume/Box   | Box 1: Series 1 [Barcode: dsc_6136526051.1] |
    | Restrictions | false |

   All other fields should be empty.

   ----

   **Note:** The "Library" field is empty when submitting from the local
   development environment because in the "common/config/config.rb" file, the
   `aeon_site_code` is set to `TEST`, which is not known to Aeon. To test the
   "Library" field, change the `aeon_site_code` to `MDRM`.

   ----

   Left-click the "Cancel - Return to Main Menu" button. The
   "Special Collections Account" page will be displayed.

10) On the "Special Collections Account" page, in the
    "William L. Amoss papers Subject Files, 1895-1927" entry, left-click
    "Actions | Cancel Request" to cancel the request without submitting it.

11) (Optional) In ArchivesSpace, type `William L. Amoss papers` into the
    "Search" box in the navigation bar, and then select the
    "William L. Amoss papers" result. On the "William L. Amoss papers" page,
    select "Publications | African-American Education and Labor -- Atlanta University, 1898"
    entry in the right sidebar.

    On the "African-American Education and Labor -- Atlanta University, 1898"
    page, verify that a "Request Box 2" button is shown to the right of the
    "Download PDF" button.

----
[aeon_fulfillment]: https://github.com/AtlasSystems/ArchivesSpace-Aeon-Fulfillment-Plugin
[aspace-custom]: https://github.com/umd-lib/aspace-custom
[dev_setup]: https://github.com/umd-lib/aspace-custom/blob/main/docs/DevelopmentSetup.md
