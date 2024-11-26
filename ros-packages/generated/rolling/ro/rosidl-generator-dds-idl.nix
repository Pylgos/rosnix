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
  version = "0.12.0-1";
  src = finalAttrs.passthru.sources."rosidl_generator_dds_idl";
  propagatedNativeBuildInputs = [ ament-cmake rosidl-cli rosidl-pycommon ];
  propagatedBuildInputs = [ ament-index-python ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_generator_dds_idl" = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_dds_idl-source";
        url = "https://github.com/ros2-gbp/rosidl_dds-release.git";
        rev = "6a982f6a23613fc9e11e8ecba8e801572e086db4";
        hash = "sha256-9NvhSKlCK6YIvPuX1Lp3QZSJ2Wnl+rN0DuNMKvnTH7s=";
      };
    };
  });
  meta = {
    description = "Generate the DDS interfaces for ROS interfaces.";
  };
})
