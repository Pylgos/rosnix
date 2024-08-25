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
        rev = "6b1fa1f0baf2de6714b624a1327a4772669c1efc";
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
  propagatedNativeBuildInputs = [ cmake pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen flann ode python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "OMPL is a free sampling-based motion planning library.";
  };
}
