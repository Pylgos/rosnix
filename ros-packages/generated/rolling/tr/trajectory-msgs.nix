{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "trajectory_msgs";
  version = "5.8.1-1";
  src = finalAttrs.passthru.sources."trajectory_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "trajectory_msgs" = substituteSource {
      src = fetchgit {
        name = "trajectory_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "f096cf22ae5376fdd76a1acff50bd4b9c13d2fda";
        hash = "sha256-TCcGee+zR5tcvqgZYzRd3B3gn2QQ+/ewHjssrzg2/jU=";
      };
    };
  });
  meta = {
    description = "A package containing some robot trajectory message definitions.";
  };
})
