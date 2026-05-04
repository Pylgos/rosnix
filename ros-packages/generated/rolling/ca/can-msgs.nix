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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "can_msgs";
  version = "2.0.0-6";
  src = finalAttrs.passthru.sources."can_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "can_msgs" = substituteSource {
      src = fetchgit {
        name = "can_msgs-source";
        url = "https://github.com/ros2-gbp/ros_canopen-release.git";
        rev = "c1e00abe66c368dd30af453ad96eaa2becff1acf";
        hash = "sha256-9K7mCEEppzWP9ITzFZlJje6JHNIFoBxJ/FXPs+NoX4M=";
      };
    };
  });
  meta = {
    description = "CAN related message types.";
  };
})
