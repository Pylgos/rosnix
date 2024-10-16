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
let
  sources = mkSourceSet (sources: {
    "topic_tools_interfaces" = substituteSource {
      src = fetchgit {
        name = "topic_tools_interfaces-source";
        url = "https://github.com/ros2-gbp/topic_tools-release.git";
        rev = "fcbeeb4b109752c5f5b9f81977a05035a99cbaa0";
        hash = "sha256-laUwRCaugpGki+NjwQq/SSvB7hDtAl7zoLLJcPt21gs=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "topic_tools_interfaces";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."topic_tools_interfaces";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "topic_tools_interfaces contains messages and services for topic_tools";
  };
})
