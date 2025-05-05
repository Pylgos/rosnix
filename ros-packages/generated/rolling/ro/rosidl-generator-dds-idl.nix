{
  ament-cmake,
  ament-cmake-pytest,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-cli,
  rosidl-pycommon,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_generator_dds_idl";
  version = "0.13.0-1";
  src = finalAttrs.passthru.sources."rosidl_generator_dds_idl";
  propagatedNativeBuildInputs = [ ament-cmake ament-index-python rosidl-cli rosidl-pycommon ];
  propagatedBuildInputs = [ ament-cmake ament-index-python rosidl-cli rosidl-pycommon ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_generator_dds_idl" = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_dds_idl-source";
        url = "https://github.com/ros2-gbp/rosidl_dds-release.git";
        rev = "9e12703e5f2c3a3a498838a694e72c57223a88f7";
        hash = "sha256-SUIjn8GilW8A0EdkaQgnfokJLGT0K91h+LIBiLi3gmM=";
      };
    };
  });
  meta = {
    description = "Generate the DDS interfaces for ROS interfaces.";
  };
})
