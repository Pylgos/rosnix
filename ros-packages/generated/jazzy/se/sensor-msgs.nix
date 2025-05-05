{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-cmake,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sensor_msgs";
  version = "5.3.6-1";
  src = finalAttrs.passthru.sources."sensor_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rosidl-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "sensor_msgs" = substituteSource {
      src = fetchgit {
        name = "sensor_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "a6ad730e6c7141747f12465f342114ee4f23e8cb";
        hash = "sha256-XtpVsJ7XU18yonsQU5Px4JNcbyrjtFJ5Juk7XbTi4Fs=";
      };
    };
  });
  meta = {
    description = "A package containing some sensor data related message and service definitions.";
  };
})
