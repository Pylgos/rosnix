{
  ament-cmake,
  ament-cmake-pytest,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-cli,
  rosidl-pycommon,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rosidl_generator_dds_idl" = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_dds_idl-source";
        url = "https://github.com/ros2-gbp/rosidl_dds-release.git";
        rev = "6a982f6a23613fc9e11e8ecba8e801572e086db4";
        hash = "sha256-9NvhSKlCK6YIvPuX1Lp3QZSJ2Wnl+rN0DuNMKvnTH7s=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rosidl_generator_dds_idl";
  version = "0.12.0-1";
  src = sources."rosidl_generator_dds_idl";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake rosidl-cli rosidl-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-index-python ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Generate the DDS interfaces for ROS interfaces.";
  };
}
