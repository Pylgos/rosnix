{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
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
  pname = "topic_tools_interfaces";
  version = "1.3.2-1";
  src = finalAttrs.passthru.sources."topic_tools_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "topic_tools_interfaces" = substituteSource {
        src = fetchgit {
          name = "topic_tools_interfaces-source";
          url = "https://github.com/ros2-gbp/topic_tools-release.git";
          rev = "6b8b5a858de893da33765f4088de77d6d34994ec";
          hash = "sha256-Bll3fTZDwv7tif/1J6tQ8w4+BiMXOOWXpMKthFQ+yjY=";
        };
      };
    });
  };
  meta = {
    description = "topic_tools_interfaces contains messages and services for topic_tools";
  };
})
