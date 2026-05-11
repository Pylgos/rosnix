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
  version = "0.14.0-1";
  src = finalAttrs.passthru.sources."rosidl_generator_dds_idl";
  propagatedNativeBuildInputs = [ ament-cmake ament-index-python rosidl-cli rosidl-pycommon ];
  propagatedBuildInputs = [ ament-cmake ament-index-python rosidl-cli rosidl-pycommon ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_generator_dds_idl" = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_dds_idl-source";
        url = "https://github.com/ros2-gbp/rosidl_dds-release.git";
        rev = "fdabd907dbce64136a622e4de46eeff69f7dba74";
        hash = "sha256-TuPLR08Csh3p3tppp6p4y1RZgS9RmlvEgwiFUyrRefE=";
      };
    };
  });
  meta = {
    description = "Generate the DDS interfaces for ROS interfaces.";
  };
})
