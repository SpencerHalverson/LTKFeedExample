#  Instructions For Test

We would like for you to complete a small project and demonstration so that we can get a feel for your skills and how you will gel with our team. I’ll briefly describe the project requirements, then the process that you should follow to submit your work to us, and then how the demonstration will go. Please do not spend more than two or three hours on this project, it is ok if you do not finish because this is meant to be a challenge. We’re more interested in your process and the efficacy of the code that you do write than the amount of features that you complete.

Requirements

Build a feed of full-width images that are consumed from a production API.

All of our images are in an aspect ratio that supports an edge-to-edge (full-width) UI. So, no worries there.
The feed should support pagination (using the info provided in the meta field of the response)
When a user taps on one of the full-width images, then a detail view should be pushed onto the view stack. The detail view should contain product images, the hero image, and the profile picture.

All of this information is returned from the API. To relate the different models together (ltk, product, and profile), take a look at the JSON that is returned. There are top-level lists for each of these. The ltk has a list of associated product_ids and an associated profile_id.
When a user taps on one of the product images, then the associated products.hyperlink should resolve in a WebView (either in safari or in the app itself).

To power the above requirements, you’ll consume the following public API: https://api-gateway.rewardstyle.com/api/ltk/v2/ltks/?featured=true&limit=20
