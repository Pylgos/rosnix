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
  version = "2.0.0-5";
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
        rev = "16b0f665d531eec81533d177c14ce210dc105adb";
        hash = "sha256-9K7mCEEppzWP9ITzFZlJje6JHNIFoBxJ/FXPs+NoX4M=";
      };
    };
  });
  meta = {
    description = "CAN related message types.";
  };
})
