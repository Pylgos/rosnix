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
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."topic_tools_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "topic_tools_interfaces" = substituteSource {
      src = fetchgit {
        name = "topic_tools_interfaces-source";
        url = "https://github.com/ros2-gbp/topic_tools-release.git";
        rev = "fcbeeb4b109752c5f5b9f81977a05035a99cbaa0";
        hash = "sha256-laUwRCaugpGki+NjwQq/SSvB7hDtAl7zoLLJcPt21gs=";
      };
    };
  });
  meta = {
    description = "topic_tools_interfaces contains messages and services for topic_tools";
  };
})
