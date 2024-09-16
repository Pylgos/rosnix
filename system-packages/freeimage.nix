{
  stdenv,
  fetchFromGitHub,
  cmake,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "freeimage";
  version = "3.19.7";

  src = fetchFromGitHub {
    owner = "danoli3";
    repo = "FreeImage";
    rev = "3.19.7";
    hash = "sha256-rMmMe9pkCv7GXxtfBXXzNV748EKOzB1LQdXqGOev798=";
  };

  nativeBuildInputs = [ cmake ];

  meta = {
    description = "Open Source library for accessing popular graphics image file formats";
  };
})
