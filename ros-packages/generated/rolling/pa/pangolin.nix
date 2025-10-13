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
  version = "0.9.4-1";
  src = finalAttrs.passthru.sources."pangolin";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libepoxy-dev" "libglew-dev" "libjpeg" "libpng-dev" "libxkbcommon-dev" "opengl" "python3-dev" "python3-wheel" "wayland" "wayland-dev" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libepoxy-dev" "libglew-dev" "libjpeg" "libpng-dev" "libxkbcommon-dev" "opengl" "python3-dev" "python3-wheel" "wayland" "wayland-dev" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "catch2" ]; };
  passthru.sources = mkSourceSet (sources: {
    "pangolin" = substituteSource {
      src = fetchgit {
        name = "pangolin-source";
        url = "https://github.com/ros2-gbp/Pangolin-release.git";
        rev = "24bf0224e4cae6ae522a46324fe0b8899480fc72";
        hash = "sha256-0qedtftu0wocEmGRfQVT7uj9zSXbEmjwdMnbvSmTV7U=";
      };
    };
  });
  meta = {
    description = "Pangolin is a set of lightweight and portable utility libraries for prototyping 3D, numeric or video based programs and algorithms.";
  };
})
