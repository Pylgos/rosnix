{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mola_yaml,
  mrpt_libgui,
  mrpt_libmaps,
  mrpt_libobs,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    mola_kernel-006fd7512426ebbde555b6d1e73c0d8be5ef132b = substituteSource {
      src = fetchgit {
        name = "mola_kernel-006fd7512426ebbde555b6d1e73c0d8be5ef132b-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "006fd7512426ebbde555b6d1e73c0d8be5ef132b";
        hash = "sha256-EwNZImxor7hUEfUTSXe6V2ay8MrqEwiKRdvpsW9KwJI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_kernel";
  version = "1.2.0-1";
  src = sources.mola_kernel-006fd7512426ebbde555b6d1e73c0d8be5ef132b;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mola_common mola_yaml mrpt_libgui mrpt_libmaps mrpt_libobs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Fundamental C++ virtual interfaces and data types for the rest of MOLA modules";
  };
}
