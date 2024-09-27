{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    linux_isolate_process-adcde99dc53e5480e71a4533a5e438325f72a216 = substituteSource {
      src = fetchgit {
        name = "linux_isolate_process-adcde99dc53e5480e71a4533a5e438325f72a216-source";
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
  src = sources.linux_isolate_process-adcde99dc53e5480e71a4533a5e438325f72a216;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "A tool to isolate ros2 nodes";
  };
}
