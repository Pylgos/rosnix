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
  version = "2.0.4-1";
  src = finalAttrs.passthru.sources."dataspeed_can";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dataspeed-can-msg-filters dataspeed-can-msgs dataspeed-can-tools dataspeed-can-usb ];
  passthru.sources = mkSourceSet (sources: {
    "dataspeed_can" = substituteSource {
      src = fetchgit {
        name = "dataspeed_can-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "215fd5105f5b84039373012493bfb6c49316b6c3";
        hash = "sha256-9p4ziWt8ief6N+GFSFlNIRqrz/HfSNqpIR7/UtwU6aI=";
      };
    };
  });
  meta = {
    description = "CAN bus tools using Dataspeed hardware";
  };
})
