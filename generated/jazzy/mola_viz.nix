{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_kernel,
  mrpt_libgui,
  mrpt_libmaps,
  mrpt_libopengl,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    mola_viz = substituteSource {
      src = fetchgit {
        name = "mola_viz-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "b43e97c269d5c6c81151b54e5480694ed7286b22";
        hash = "sha256-Vr0gl/J/Sk30LMusvG3latH8D4wQrrbgSh3hrDE1GWM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_viz";
  version = "1.2.0-1";
  src = sources.mola_viz;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mola_kernel mrpt_libgui mrpt_libmaps mrpt_libopengl ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "GUI for MOLA";
  };
}
