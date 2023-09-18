
{ stdenv, cmake, gcc-arm-embedded, hytech_hal}:

stdenv.mkDerivation rec {
  pname = "screen_lib";
  version = "0.1.0";
  src = ./.;
  nativeBuildInputs = [ cmake ];
  propagatedBuildInputs = [ gcc-arm-embedded hytech_hal ];
  # dontPatch = true;
  # dontFixup = true;
  # dontStrip = true;
  # dontPatchELF = true;
}
