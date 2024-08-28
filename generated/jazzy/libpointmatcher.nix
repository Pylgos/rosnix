{
  buildRosPackage,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  libnabo,
  libyamlcpp,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    libpointmatcher = substituteSource {
      src = fetchgit {
        name = "libpointmatcher-source";
        url = "https://github.com/ros2-gbp/libpointmatcher-release.git";
        rev = "42d41781f7dcc4dc8151c3985cb5825bdeaf8978";
        hash = "sha256-Dc7s28fmp2qhKe+0NG+8xjM0KMSvt8o6mGF2liWpEB4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libpointmatcher";
  version = "1.4.2-1";
  src = sources.libpointmatcher;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen libnabo libyamlcpp python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "libpointmatcher is a modular ICP library, useful for robotics and computer vision.";
  };
}
