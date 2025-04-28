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
  version = "1.1.4-1";
  src = finalAttrs.passthru.sources."wireless_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "wireless_msgs" = substituteSource {
      src = fetchgit {
        name = "wireless_msgs-source";
        url = "https://github.com/clearpath-gbp/wireless-release.git";
        rev = "8c2906108d09fbaba528e20b5579887b174e30ab";
        hash = "sha256-zqwELnY3cGfUlXYGp0GbnuQybxeKHikRSW52VGnFt4Q=";
      };
    };
  });
  meta = {
    description = "Messages for describing a wireless network such as bitrate, essid, and link quality.";
  };
})
