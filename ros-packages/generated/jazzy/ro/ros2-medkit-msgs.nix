{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  diagnostic-msgs,
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
  pname = "ros2_medkit_msgs";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."ros2_medkit_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces diagnostic-msgs rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces diagnostic-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_medkit_msgs" = substituteSource {
      src = fetchgit {
        name = "ros2_medkit_msgs-source";
        url = "https://github.com/ros2-gbp/ros2_medkit-release.git";
        rev = "0c89276d73749a94d8ab93064390ef7118cd99fa";
        hash = "sha256-16+v5ZARpxds3CKmqbZni+UR+RjY5PWrjLxx0Tk6uFY=";
      };
    };
  });
  meta = {
    description = "ROS 2 message and service definitions for ros2_medkit fault management";
  };
})
