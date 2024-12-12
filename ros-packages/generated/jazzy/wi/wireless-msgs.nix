{
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "wireless_msgs";
  version = "1.1.2-1";
  src = finalAttrs.passthru.sources."wireless_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "wireless_msgs" = substituteSource {
      src = fetchgit {
        name = "wireless_msgs-source";
        url = "https://github.com/clearpath-gbp/wireless-release.git";
        rev = "03c0bcfa1c9f791c447081227986c26d3d3e495f";
        hash = "sha256-GU4fZI4ZwhsJN33USn3zqEiysvvyGDUb9YQRCL6LnV4=";
      };
    };
  });
  meta = {
    description = "Messages for describing a wireless network such as bitrate, essid, and link quality.";
  };
})
