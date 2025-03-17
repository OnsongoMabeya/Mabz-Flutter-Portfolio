# Font Installation Instructions

1. Download the Poppins font family from Google Fonts:

   - Visit: https://fonts.google.com/specimen/Poppins
   - Click "Download family"

2. Extract the downloaded zip file

3. Copy these specific files to your project's `assets/fonts` directory:
   - Poppins-Regular.ttf
   - Poppins-Medium.ttf
   - Poppins-SemiBold.ttf
   - Poppins-Bold.ttf

4. After copying the files, run:

   ```bash
   flutter pub get
   ```

5. Then clean and rebuild the project:

   ```bash
   flutter clean
   flutter pub get
   ```

Alternative: You can also modify the pubspec.yaml to use the Google Fonts package instead of local fonts. To do this:

1. Remove the fonts section from pubspec.yaml
2. The app will automatically use the Google Fonts package that's already included in the dependencies.
