{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    robot_upstart = substituteSource {
      src = fetchgit {
        name = "robot_upstart-source";
        url = "https://github.com/clearpath-gbp/robot_upstart-release.git";
        rev = "bd299c8ce71d1419b31afc8daebfe81daa2c4e13";
        hash = "sha256-rSLxwHWQH5oc7pInTJF/CiLl1feRETCyJtPSyv5ioEE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "robot_upstart";
  version = "1.0.4-1";
  src = sources.robot_upstart;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "The robot_upstart package provides scripts which may be used to install and uninstall Ubuntu Linux upstart jobs which launch groups of roslaunch files.";
  };
}
