{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_pycodestyle,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
  uncrustify_vendor,
}:
let
  sources = rec {
    ament_uncrustify = substituteSource {
      src = fetchgit {
        name = "ament_uncrustify-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "4b95da7542ecd4e0178956e8067b78be8c9588b8";
        hash = "sha256-zLma8lPxGUpuHaQSfwEtRY4npt/4bNCOHQbjmYWevgQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_uncrustify";
  version = "0.17.1-1";
  src = sources.ament_uncrustify;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ uncrustify_vendor ];
  buildInputs = [  ];
  propagatedBuildInputs = [ uncrustify_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_pycodestyle python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to check code against style conventions using uncrustify and generate xUnit test result files.";
  };
}
