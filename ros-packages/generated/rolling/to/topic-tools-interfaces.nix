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
  version = "1.4.4-1";
  src = finalAttrs.passthru.sources."topic_tools_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "topic_tools_interfaces" = substituteSource {
      src = fetchgit {
        name = "topic_tools_interfaces-source";
        url = "https://github.com/ros2-gbp/topic_tools-release.git";
        rev = "8935cef67244ecb9c883f0e7cc8318064663624e";
        hash = "sha256-cIqiKqPpaog0JFK4O/SuVBjPVRtS9vF8xNnbFdbv9lc=";
      };
    };
  });
  meta = {
    description = "topic_tools_interfaces contains messages and services for topic_tools";
  };
})
