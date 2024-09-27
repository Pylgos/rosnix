{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_parser,
  substituteSource,
}:
let
  sources = rec {
    rosidl_pycommon-52cb2514bde8ec8e606415c200f80e21ec8b391f = substituteSource {
      src = fetchgit {
        name = "rosidl_pycommon-52cb2514bde8ec8e606415c200f80e21ec8b391f-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "52cb2514bde8ec8e606415c200f80e21ec8b391f";
        hash = "sha256-HwtksPYLXC/1Md1Fnyo0Ofiui7YhfDehVHn6SqcKSGM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_pycommon";
  version = "4.6.4-1";
  src = sources.rosidl_pycommon-52cb2514bde8ec8e606415c200f80e21ec8b391f;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Common Python functions used by rosidl packages.";
  };
}
