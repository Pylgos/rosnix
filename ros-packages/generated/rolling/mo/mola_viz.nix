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
    mola_viz-1c0a0d448a1e2b09517d905212eb4357b5c0a583 = substituteSource {
      src = fetchgit {
        name = "mola_viz-1c0a0d448a1e2b09517d905212eb4357b5c0a583-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "1c0a0d448a1e2b09517d905212eb4357b5c0a583";
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
  src = sources.mola_viz-1c0a0d448a1e2b09517d905212eb4357b5c0a583;
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
