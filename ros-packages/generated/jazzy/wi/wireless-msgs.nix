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
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."wireless_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "wireless_msgs" = substituteSource {
      src = fetchgit {
        name = "wireless_msgs-source";
        url = "https://github.com/clearpath-gbp/wireless-release.git";
        rev = "10df65d0dcffc367a2f74f04541d4717408e6d5a";
        hash = "sha256-z/UKolna7Ts80pdh/LF4KcqGQyUFMER1/AU9ANL8PiU=";
      };
    };
  });
  meta = {
    description = "Messages for describing a wireless network such as bitrate, essid, and link quality.";
  };
})
