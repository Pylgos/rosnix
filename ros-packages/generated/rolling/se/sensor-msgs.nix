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
  version = "5.8.1-1";
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
        rev = "d66fc2766795547452a95fd64e76b13f17c89b51";
        hash = "sha256-bS/TcgcCS+jMRNbvHulLSX8GeTtXr8bKmH7UoovcrEU=";
      };
    };
  });
  meta = {
    description = "A package containing some sensor data related message and service definitions.";
  };
})
