{
  ament-cmake,
  buildAmentCmakePackage,
  dataspeed-can-msg-filters,
  dataspeed-can-msgs,
  dataspeed-can-tools,
  dataspeed-can-usb,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dataspeed_can";
  version = "2.0.5-1";
  src = finalAttrs.passthru.sources."dataspeed_can";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dataspeed-can-msg-filters dataspeed-can-msgs dataspeed-can-tools dataspeed-can-usb ];
  passthru.sources = mkSourceSet (sources: {
    "dataspeed_can" = substituteSource {
      src = fetchgit {
        name = "dataspeed_can-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "7a8447881ecefd1bb33d19a64743f9ae7d71cd27";
        hash = "sha256-jirFzaUy+tt4gIKQ/pS7mbLgC0cZrMMq7X5qkmIHasE=";
      };
    };
  });
  meta = {
    description = "CAN bus tools using Dataspeed hardware";
  };
})
