# SignupMobile

Mobile site for people to sign up for the Sanders mailing list.

## Development

### Prerequisites

* git
* npm
* bower (`npm install -g bower`)

### Setup

1. Clone the repository (`git clone git@github.com:Bernie-2016/SignupMobile.git`)
2. Install npm dependencies: `npm install`
3. Install bower dependencies: `bower install`
4. Build assets: `grunt`
5. Open `index.html` in a browser window

The default grunt task compiles CoffeeScript and concatenates/minifies everything into `dist/`, which is where `index.html` expects it. `grunt watch` re-runs the default task whenever a source file changes. `grunt build` runs the default task and builds necessary files into a zipfile, suitable for uploading to a hosting service.

## Contributing

1. Fork it ( https://github.com/Bernie-2016/SignupMobile/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## License

[AGPL](http://www.gnu.org/licenses/agpl-3.0.en.html)
