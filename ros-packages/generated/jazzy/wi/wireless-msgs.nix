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
  version = "1.1.5-1";
  src = finalAttrs.passthru.sources."wireless_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "wireless_msgs" = substituteSource {
      src = fetchgit {
        name = "wireless_msgs-source";
        url = "https://github.com/clearpath-gbp/wireless-release.git";
        rev = "86fbf25317ff2114306346703e92fed1fd0d71b9";
        hash = "sha256-kA7n73VCLUVBvZ/zmWwbOnLWg66vOuyneJ9Gw8G2poA=";
      };
    };
  });
  meta = {
    description = "Messages for describing a wireless network such as bitrate, essid, and link quality.";
  };
})
