# QuicklookVideo

This is a **QuickLook** plugin for Mac OS X that permits to have a thumbnail and Quicklook of a video directly in the Finder.

![QuicklookVideo finder icons](https://raw.githubusercontent.com/BestPig/QuicklookVideo/master/screens/finder.png)

![QuicklookVideo QL preview](https://raw.githubusercontent.com/BestPig/QuicklookVideo/master/screens/quicklook.png)


### Installation

#### 1. Precompiled release

Finally you can download the plugin [here](https://github.com/BestPig/QuicklookVideo/archive/QuicklookVideo-v0.1.zip "QuicklookVideo-v0.1.zip").

Unzip it, and place it in */Library/QuickLook* or *~/Library/QuickLook*.

You will need to restart the *QuickLook* daemon by running these commands in the terminal :

	qlmanage -r

	qlmanage -r cache

### Building

#### 1. Xcode-tools

Open **Terminal.app** and type :

	xcode-select --install


#### 2. Homebrew

If you don't have [homebrew](http://brew.sh "homebrew website") already installed:

	ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

	brew update


#### 3. ffmpegthumbnailer

Then you need [ffmpegthumbnailer](https://code.google.com/p/ffmpegthumbnailer/ "ffmpegthumbnailer website").

	brew install ffmpegthumbnailer

#### 3. Xcode

Open the QuicklookVideo.xcodeproj file and build it ;).


### License

***QuicklookVideo*** is released under the *MIT license*, see **LICENSE.md**.

Site: [BestPig ToolBox(http://www.bestpig.fr "BestPig ToolBox")]

Twitter : [@BestPig](https://twitter.com/BestPig "BestPig on Twitter")
