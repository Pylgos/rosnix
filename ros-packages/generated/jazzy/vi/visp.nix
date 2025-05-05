{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "visp";
  version = "3.5.0-4";
  src = finalAttrs.passthru.sources."visp";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "bzip2" "doxygen" "eigen" "libjpeg" "liblapack-dev" "libopencv-dev" "libpng-dev" "libv4l-dev" "libx11-dev" "libxml2" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "bzip2" "doxygen" "eigen" "libjpeg" "liblapack-dev" "libopencv-dev" "libpng-dev" "libv4l-dev" "libx11-dev" "libxml2" ]; };
  passthru.sources = mkSourceSet (sources: {
    "visp" = substituteSource {
      src = fetchgit {
        name = "visp-source";
        url = "https://github.com/ros2-gbp/visp-release.git";
        rev = "86defd59f99edec4f6d6772b8eaacbcb50cd175b";
        hash = "sha256-nMrdYB+RessgluLVeY69cP1jA4ucoAfcxyaNk1gyiSQ=";
      };
    };
  });
  meta = {
    description = "\n    ViSP standing for Visual Servoing Platform is a modular cross\n    platform library that allows prototyping and developing applications\n    using visual tracking and visual servoing technics at the heart of the\n    researches done by Inria Lagadic team. ViSP is able to compute control\n    laws that can be applied to robotic systems. It provides a set of visual\n    features that can be tracked using real time image processing or computer\n    vision algorithms. ViSP provides also simulation capabilities.\n\n    ViSP can be useful in robotics, computer vision, augmented reality\n    and computer animation.\n  ";
  };
})
