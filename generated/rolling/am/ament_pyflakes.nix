{
  ament_pycodestyle,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_pyflakes-ddcd0aaab591940e89e7099fc8134fa27707d1c3 = substituteSource {
      src = fetchgit {
        name = "ament_pyflakes-ddcd0aaab591940e89e7099fc8134fa27707d1c3-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "ddcd0aaab591940e89e7099fc8134fa27707d1c3";
        hash = "sha256-GdDuVhfdtVs/Q6ePDhpXnxvCjqgw/b2+/qxwpYJHXk8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_pyflakes";
  version = "0.18.1-1";
  src = sources.ament_pyflakes-ddcd0aaab591940e89e7099fc8134fa27707d1c3;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pyflakes3" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pyflakes3" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_pycodestyle ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "The ability to check code using pyflakes and generate xUnit test result files.";
  };
}
