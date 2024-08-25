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
        rev = "23e3db61b290da2cd55b842f885bcaf52b2c7d5a";
        hash = "sha256-7tGaeoTdimWE/QiAy+yt+6cg95i9xFZs4qE7g68hPNc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libpointmatcher";
  version = "1.4.1-1";
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
