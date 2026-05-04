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
  version = "0.9.5-2";
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
        rev = "8f3b86996983f6641cfdc3b1c216bd5d49b81701";
        hash = "sha256-fI3cvD+FyydBNqSIcJZoYyU+6r5U/N+qlw2RQ89KKGw=";
      };
    };
  });
  meta = {
    description = "Pangolin is a set of lightweight and portable utility libraries for prototyping 3D, numeric or video based programs and algorithms.";
  };
})
