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
  version = "2.0.6-1";
  src = finalAttrs.passthru.sources."dataspeed_can";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dataspeed-can-msg-filters dataspeed-can-msgs dataspeed-can-tools dataspeed-can-usb ];
  passthru.sources = mkSourceSet (sources: {
    "dataspeed_can" = substituteSource {
      src = fetchgit {
        name = "dataspeed_can-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "aade6a78055bcee8a21304c788a171d2de42bda5";
        hash = "sha256-Fl3FgK6vIuuY8aAQwvgrjnOBTEkX8aa9/uesgtdC2Jc=";
      };
    };
  });
  meta = {
    description = "CAN bus tools using Dataspeed hardware";
  };
})
