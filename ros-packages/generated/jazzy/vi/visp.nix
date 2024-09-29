{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "visp" = substituteSource {
      src = fetchgit {
        name = "visp-source";
        url = "https://github.com/ros2-gbp/visp-release.git";
        rev = "86defd59f99edec4f6d6772b8eaacbcb50cd175b";
        hash = "sha256-nMrdYB+RessgluLVeY69cP1jA4ucoAfcxyaNk1gyiSQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "visp";
  version = "3.5.0-4";
  src = sources."visp";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "bzip2" "eigen" "libjpeg" "liblapack-dev" "libopencv-dev" "libpng-dev" "libv4l-dev" "libx11-dev" "libxml2" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ViSP standing for Visual Servoing Platform is a modular cross platform library that allows prototyping and developing applications using visual tracking and visual servoing technics at the heart of the researches done by Inria Lagadic team. ViSP is able to compute control laws that can be applied to robotic systems. It provides a set of visual features that can be tracked using real time image processing or computer vision algorithms. ViSP provides also simulation capabilities. ViSP can be useful in robotics, computer vision, augmented reality and computer animation.";
  };
}