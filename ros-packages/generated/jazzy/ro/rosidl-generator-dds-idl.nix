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
  version = "0.11.1-3";
  src = finalAttrs.passthru.sources."rosidl_generator_dds_idl";
  propagatedNativeBuildInputs = [ ament-cmake ament-index-python rosidl-cli rosidl-pycommon ];
  propagatedBuildInputs = [ ament-cmake ament-index-python rosidl-cli rosidl-pycommon ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_generator_dds_idl" = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_dds_idl-source";
        url = "https://github.com/ros2-gbp/rosidl_dds-release.git";
        rev = "97af97f45b3bb41d4e49c28aa1f50a7ff48e5554";
        hash = "sha256-nJaLUL1Ey0Ie3J6YMr3sYag2w9r0FEkdrowJp1MGklY=";
      };
    };
  });
  meta = {
    description = "Generate the DDS interfaces for ROS interfaces.";
  };
})
