{
  ament_copyright,
  ament_flake8,
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
    linux_isolate_process = substituteSource {
      src = fetchgit {
        name = "linux_isolate_process-source";
        url = "https://github.com/ros2-gbp/linux_isolate_process-release.git";
        rev = "adcde99dc53e5480e71a4533a5e438325f72a216";
        hash = "sha256-1MOoCotNkz3eD3lwztz0QfmCyDxEk36KY1YmdCQIjK4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "linux_isolate_process";
  version = "0.0.2-3";
  src = sources.linux_isolate_process;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "A tool to isolate ros2 nodes";
  };
}
