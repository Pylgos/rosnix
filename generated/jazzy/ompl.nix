{
  buildRosPackage,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  flann,
  ode,
  pkg-config,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    ompl = substituteSource {
      src = fetchgit {
        name = "ompl-source";
        url = "https://github.com/ros2-gbp/ompl-release.git";
        rev = "fda1cb4c5d644b8ea2932b45d35293cd62ff5dcd";
        hash = "sha256-Dst2FtQsK0+EzvSm7GEESWOU8QfMPzhSNNYEIlTNfc0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ompl";
  version = "1.6.0-1";
  src = sources.ompl;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ cmake eigen pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flann ode python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "OMPL is a free sampling-based motion planning library.";
  };
}
