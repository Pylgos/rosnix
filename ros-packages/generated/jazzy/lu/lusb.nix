{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lusb";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."lusb";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libusb-1.0-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "lusb" = substituteSource {
      src = fetchgit {
        name = "lusb-source";
        url = "https://github.com/DataspeedInc-release/lusb-release.git";
        rev = "37d85f008df91a5f6e79482a7538328264e1993d";
        hash = "sha256-SD5KijVFijbNlJHhaYmWwiZUZ9DLVPLymvxKIj2AuoE=";
      };
    };
  });
  meta = {
    description = "Library for interfacing to USB devices";
  };
})
