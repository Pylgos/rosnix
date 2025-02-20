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
  version = "1.3.3-1";
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
        rev = "667e5543b19d8d575326e16bafd9be674cbc5442";
        hash = "sha256-ek32/65CB+LxpMkyLuNkEtKqAd0Ml5f1K1cm5EqhZ9U=";
      };
    };
  });
  meta = {
    description = "topic_tools_interfaces contains messages and services for topic_tools";
  };
})
