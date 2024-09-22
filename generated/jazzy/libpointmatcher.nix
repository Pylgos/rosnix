{
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  libnabo,
  rosSystemPackages,
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
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ libnabo ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "libpointmatcher is a modular ICP library, useful for robotics and computer vision.";
  };
}
