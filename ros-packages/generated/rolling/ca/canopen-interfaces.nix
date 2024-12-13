{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "canopen_interfaces";
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."canopen_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_interfaces" = substituteSource {
      src = fetchgit {
        name = "canopen_interfaces-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "22c60ffc0464ce630504aee2945f8f03fad8ecb8";
        hash = "sha256-inxGsj7lpFjaFWQuuPo263VGz/J/2HG2umxoBJt+u/c=";
      };
    };
  });
  meta = {
    description = "Services and Messages for ros2_canopen stack";
  };
})
