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
  pname = "pangolin";
  version = "0.9.1-2";
  src = finalAttrs.passthru.sources."pangolin";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libglew-dev" "libpng-dev" "libturbojpeg" "libxkbcommon-dev" "wayland" "wayland-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "pangolin" = substituteSource {
      src = fetchgit {
        name = "pangolin-source";
        url = "https://github.com/ros2-gbp/Pangolin-release.git";
        rev = "04bcab4ca44adc9f6c3bf5e503d3bf84381e771a";
        hash = "sha256-VAE6VKDuVagjFsw1q6X/hpGUYbDSIx+Os9F+/76bo08=";
      };
    };
  });
  meta = {
    description = "Pangolin is a set of lightweight and portable utility libraries for prototyping 3D, numeric or video based programs and algorithms.";
  };
})
