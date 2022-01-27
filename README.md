# wordle_clone

Deploy to web:

```bash
# cache the flutter sdk
if cd flutter; then git pull && cd ..;
# otherwise clone it from flutter
else git clone https://github.com/flutter/flutter.git; fi &&
# enable web as a platform to release to
flutter/bin/flutter config --enable-web &&
# run the build script (only command you need if deploying locally)
flutter/bin/flutter build web --release
```
