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
  version = "3.5.0-3";
  src = finalAttrs.passthru.sources."visp";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "bzip2" "eigen" "libjpeg" "liblapack-dev" "libopencv-dev" "libpng-dev" "libv4l-dev" "libx11-dev" "libxml2" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "visp" = substituteSource {
        src = fetchgit {
          name = "visp-source";
          url = "https://github.com/ros2-gbp/visp-release.git";
          rev = "40579e7c751095b9add34bc8060cd95ada214ab0";
          hash = "sha256-nMrdYB+RessgluLVeY69cP1jA4ucoAfcxyaNk1gyiSQ=";
        };
      };
    });
  };
  meta = {
    description = "ViSP standing for Visual Servoing Platform is a modular cross platform library that allows prototyping and developing applications using visual tracking and visual servoing technics at the heart of the researches done by Inria Lagadic team. ViSP is able to compute control laws that can be applied to robotic systems. It provides a set of visual features that can be tracked using real time image processing or computer vision algorithms. ViSP provides also simulation capabilities. ViSP can be useful in robotics, computer vision, augmented reality and computer animation.";
  };
})
